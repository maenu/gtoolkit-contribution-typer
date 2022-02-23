Class {
	#name : #TypInfFlowMethod,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #execution }
TypInfFlowMethod >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfFlowMethod >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfFlowMethod >> initialValueIn: aState [

	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments:
		  (node arguments collect: [ :e | TypUnknownType instance ])
		  argumentsOptional: false
		  signalsAlways: nil
]

{ #category : #accessing }
TypInfFlowMethod >> methodIn: aState [

	^ aState self
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: [ :e | aState at: e ])
]

{ #category : #accessing }
TypInfFlowMethod >> transfer: aState [

	aState at: self put: (self methodIn: aState)
]

{ #category : #visiting }
TypInfFlowMethod >> visitMethodNode: aMethodNode [

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
					  nil outgoingRemoveAt: #type ].
				  self visitNode: aMethodNode body.
				  newProfile keys , { aMethodNode } do: [ :e | 
					  nil outgoingRemoveAt: e ].
				  newProfile := aMethodNode typInfProfileIn: nil ].
			  returns := (aMethodNode allChildren
				              select: #isReturn
				              thenCollect: [ :e | self visitNode: e ]) as:
				             OrderedCollection.
			  aMethodNode lastIsReturn ifFalse: [ returns add: nil ].
			  CompiledMethod
				  typAsFunctionTypeWithResult: returns typAsType
				  arguments:
				  (aMethodNode arguments collect: [ :e | self visitNode: e ])
				  argumentsOptional: false
				  signalsAlways: nil ]
		  or: [ 
			  CompiledMethod
				  typAsFunctionTypeWithResult: aMethodNode typInfNode typeUnknown
				  arguments: (aMethodNode arguments collect: [ :e | 
						   aMethodNode typInfNode typeUnknown ])
				  argumentsOptional: false
				  signalsAlways: nil ]
]
