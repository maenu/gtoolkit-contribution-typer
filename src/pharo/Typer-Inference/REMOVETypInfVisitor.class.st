Class {
	#name : #REMOVETypInfVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #visiting }
REMOVETypInfVisitor >> visitArgumentVariableNode: aNode [

	| type sendNodes sendSelectors sendClasses useTypes |
	aNode isDefinition ifFalse: [ 
		^ self visitNode:
			  ((aNode whoDefines: aNode name) arguments detect: [ :e | 
				   e = aNode ]) ].
	type := aNode parent typInfArgumentTypeOf: aNode in: selfType.
	type isUnknown ifFalse: [ ^ type ].
	sendNodes := (aNode whoDefines: aNode name) sendNodes select: [ :e | 
		             e receiver = aNode ].
	sendSelectors := sendNodes collect: #selector as: Set.
	sendClasses := (sendSelectors flatCollect: #typInfImplementors)
		               inject: Set new
		               into: [ :r :e | 
			               r
				               detect: [ :f | e methodClass inheritsFrom: f ]
				               ifNone: [ r add: e methodClass ].
			               r ].
	(sendClasses size between: 1 and: 8) ifTrue: [ 
		^ (sendClasses collect: #typAsType) typAsType ].
	useTypes := OrderedCollection new.
	(aNode whoDefines: aNode name) nodesDo: [ :e | 
		e = aNode ifTrue: [ 
			| parent |
			parent := e parent.
			(parent isMessage and: [ parent arguments includes: aNode ]) 
				ifTrue: [ 
					useTypes add: ((parent typInfMethodIn: selfType) arguments
							 at: (parent arguments indexOf: aNode)
							 ifAbsent: [ aNode typInfNode typeUnknown ]) ].
			(parent isAssignment and: [ parent value = aNode ]) ifTrue: [ 
				useTypes add: (self visitNode: parent variable) ] ] ].
	useTypes ifEmpty: [ ^ aNode typInfNode typeUnknown ].
	^ useTypes typAsType
]

{ #category : #visiting }
REMOVETypInfVisitor >> visitBlockNode: aBlockNode [

	^ BlockClosure
		  typAsFunctionTypeWithResult: (self visitNode: aBlockNode body)
		  arguments:
		  (aBlockNode arguments collect: [ :e | self visitNode: e ])
		  argumentsOptional: false
		  signalsAlways:
		  (REMOVETypInfSignalsAlwaysVisitor
			   signalsAlwaysOf: aBlockNode
			   self: selfType)
]

{ #category : #visiting }
REMOVETypInfVisitor >> visitMethodNode: aMethodNode [

	self flag:
		'FIXME clean up this is broken after context drop, e.g. type edges'.
	^ TypInfMethodNodeStack
		  push: aMethodNode
		  during: [ 
			  | iterations maxIterations profiles newProfile signalsAlways returns |
			  iterations := 0.
			  maxIterations := 3.
			  profiles := Set new.
			  newProfile := Dictionary new.
			  [ 
			  (profiles includes: newProfile) not and: [ 
				  iterations < maxIterations ] ] whileTrue: [ 
				  iterations := iterations + 1.
				  profiles add: newProfile.
				  (aMethodNode allChildren copyWithoutAll:
					   newProfile keys , { aMethodNode }) do: [ :e | 
					  selfType outgoingRemoveAt: #type ].
				  self visitNode: aMethodNode body.
				  newProfile keys , { aMethodNode } do: [ :e | 
					  selfType outgoingRemoveAt: e ].
				  newProfile := aMethodNode typInfProfileIn: selfType ].
			  returns := (aMethodNode allChildren
				              select: #isReturn
				              thenCollect: [ :e | self visitNode: e ]) as:
				             OrderedCollection.
			  aMethodNode lastIsReturn ifFalse: [ returns add: selfType ].
			  CompiledMethod
				  typAsFunctionTypeWithResult: returns typAsType
				  arguments:
				  (aMethodNode arguments collect: [ :e | self visitNode: e ])
				  argumentsOptional: false
				  signalsAlways:
				  (REMOVETypInfSignalsAlwaysVisitor signalsAlwaysOf: self self: selfType) ]
		  or: [ 
			  CompiledMethod
				  typAsFunctionTypeWithResult: aMethodNode typInfNode typeUnknown
				  arguments: (aMethodNode arguments collect: [ :e | 
						   aMethodNode typInfNode typeUnknown ])
				  argumentsOptional: false
				  signalsAlways: nil ]
]

{ #category : #visiting }
REMOVETypInfVisitor >> visitTemporaryVariableNode: aNode [

	aNode isDefinition ifTrue: [ 
		^ (((aNode whoDefines: aNode name) assignmentNodes select: [ :e | 
			    e variable = aNode ]) collect: [ :e | self visitNode: e value ])
			  ifEmpty: [ aNode typInfNode typeNil ]
			  ifNotEmpty: #typAsType ].
	aNode isWrite ifTrue: [ ^ self visitNode: aNode parent value ].
	^ REMOVETypInfTemporaryExecutionOrderVisitor typeOf: aNode self: selfType
]
