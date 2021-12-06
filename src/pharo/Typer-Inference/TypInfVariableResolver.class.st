Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'contexts'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableResolver >> canResolve: aLookup [

	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (aLookup receiver classDescription hasSlotNamed: aLookup selector) 
		  or: [ 
			  aLookup receiver classDescription instanceSide allClassVariables 
				  anySatisfy: [ :e | e name = aLookup selector ] ]
]

{ #category : #initialization }
TypInfVariableResolver >> initialize [

	super initialize.
	contexts := Dictionary new
]

{ #category : #invalidation }
TypInfVariableResolver >> invalidate [

	super invalidate.
	TypInfAstNode invalidate.
	contexts removeAll
]

{ #category : #invalidation }
TypInfVariableResolver >> invalidateOnClassChange: aClassAnnouncement [

	| class |
	class := aClassAnnouncement classAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		class typAsType >= receiver or: [ 
			(association key isAffectedByClassChange: aClassAnnouncement) or: [ 
				context isAffectedByClassChange: aClassAnnouncement ] ] ]
]

{ #category : #invalidation }
TypInfVariableResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	| method |
	method := aMethodAnnouncement methodAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		(method selector = selector and: [ 
			 method methodClass typAsType >= receiver ]) or: [ 
			(association key isAffectedByMethodChange: aMethodAnnouncement) 
				or: [ context isAffectedByMethodChange: aMethodAnnouncement ] ] ]
]

{ #category : #accessing }
TypInfVariableResolver >> resolve: aLookup [

	| context classVariable |
	self assert: [ self canResolve: aLookup ].
	context := contexts
		           at: aLookup receiver -> aLookup selector
		           ifAbsentPut: [ TypInfAstContext self: aLookup receiver ].
	"instance variable"
	(aLookup receiver classDescription hasSlotNamed: aLookup selector) 
		ifTrue: [ 
			^ ((aLookup receiver classDescription slotNamed: aLookup selector)
				   assignmentNodes collect: [ :e | e typInfTypeIn: context ])
				  typAsType ].
	"class variable"
	classVariable := aLookup receiver classDescription instanceSide
		                 allClassVariables detect: [ :e | 
		                 e name = aLookup selector ].
	classVariable value ifNotNil: [ :e | ^ e typInfType ].
	^ (classVariable assignmentNodes collect: [ :e | 
		   e typInfTypeIn: context ]) typAsType
]
