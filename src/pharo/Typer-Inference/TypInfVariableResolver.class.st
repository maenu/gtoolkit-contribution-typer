Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfVariableResolver >> assignedTypeOf: aVariable in: aType [

	^ (aVariable assignmentNodes collect: [ :e | 
		   e value typInfTypeSelf: aType ]) typAsType
]

{ #category : #accessing }
TypInfVariableResolver >> canResolve: aLookup [

	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription hasSlotNamed: aLookup selector) 
		ifTrue: [ ^ true ].
	^ aLookup receiver classDescription instanceSide allClassVariables 
		  anySatisfy: [ :e | e name = aLookup selector ]
]

{ #category : #invalidation }
TypInfVariableResolver >> invalidateOnClassChange: aClassAnnouncement [

	self flag: 'FIXME'
	"| class |
	class := aClassAnnouncement classAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		class typAsType >= receiver or: [ 
			(association key invalidateOnClassChange: aClassAnnouncement) or: [ 
				context invalidateOnClassChange: aClassAnnouncement ] ] ]"
]

{ #category : #invalidation }
TypInfVariableResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"| method |
	method := aMethodAnnouncement methodAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		(method selector = selector and: [ 
			 method methodClass typAsType >= receiver ]) or: [ 
			(association key invalidateOnMethodChange: aMethodAnnouncement) 
				or: [ context invalidateOnMethodChange: aMethodAnnouncement ] ] ]"
]

{ #category : #printing }
TypInfVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'inf variable'
]

{ #category : #accessing }
TypInfVariableResolver >> resolve: aLookup [

	| classDescription |
	self assert: [ self canResolve: aLookup ].
	classDescription := aLookup receiver classDescription.
	"instance variable"
	classDescription
		slotNamed: aLookup selector
		ifFound: [ :e | ^ self assignedTypeOf: e in: aLookup receiver ].
	"class variable"
	classDescription instanceSide allClassVariables
		detect: [ :e | e name = aLookup selector ]
		ifFound: [ :e | 
			^ e value
				  ifNil: [ self assignedTypeOf: e in: aLookup receiver ]
				  ifNotNil: [ e value typInfType ] ].
	self error:
		'neither class nor instance variable, should not have been accepted in the first place'
]
