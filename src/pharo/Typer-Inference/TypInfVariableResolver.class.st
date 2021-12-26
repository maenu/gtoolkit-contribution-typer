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
	(aLookup receiver classDescription hasSlotNamed: aLookup selector) 
		ifTrue: [ ^ true ].
	^ aLookup receiver classDescription instanceSide allClassVariables 
		  anySatisfy: [ :e | e name = aLookup selector ]
]

{ #category : #initialization }
TypInfVariableResolver >> initialize [

	super initialize.
	contexts := Dictionary new
]

{ #category : #invalidation }
TypInfVariableResolver >> invalidate [

	super invalidate.
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
			(association key invalidateOnClassChange: aClassAnnouncement) or: [ 
				context invalidateOnClassChange: aClassAnnouncement ] ] ]
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
			(association key invalidateOnMethodChange: aMethodAnnouncement) 
				or: [ context invalidateOnMethodChange: aMethodAnnouncement ] ] ]
]

{ #category : #printing }
TypInfVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'inf variable'
]

{ #category : #accessing }
TypInfVariableResolver >> resolve: aLookup [

	| classDescription context |
	self assert: [ self canResolve: aLookup ].
	classDescription := aLookup receiver classDescription.
	context := contexts
		           at: aLookup receiver -> aLookup selector
		           ifAbsentPut: [ TypInfAstContext self: aLookup receiver ].
	"instance variable"
	classDescription
		slotNamed: aLookup selector
		ifFound: [ :e | ^ e typInfAssignedTypeIn: context ].
	"class variable"
	classDescription instanceSide allClassVariables
		detect: [ :e | e name = aLookup selector ]
		ifFound: [ :e | 
			^ e value
				  ifNil: [ e typInfAssignedTypeIn: context ]
				  ifNotNil: [ e value typInfType ] ].
	self error:
		'neither class nor instance variable, should not have been accepted in the first place'
]
