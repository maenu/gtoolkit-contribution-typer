Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'contexts'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [

	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription includesSelector:
		  aLookup selector
]

{ #category : #initialization }
TypInfMethodResolver >> initialize [

	super initialize.
	contexts := Dictionary new
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidate [

	super invalidate.
	contexts removeAll
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnClassChange: aClassAnnouncement [

	| class |
	class := aClassAnnouncement classAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		self flag: 'FIXME figure out how invalidation should work'.
		class typAsType >= receiver or: [ 
			(receiver invalidateOnClassChange: aClassAnnouncement) or: [ 
				context invalidateOnClassChange: aClassAnnouncement ] ] ]
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnMethodChange: aMethodAnnouncement [

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

{ #category : #accessing }
TypInfMethodResolver >> resolve: aLookup [

	| context |
	self assert: [ self canResolve: aLookup ].
	context := contexts
		           at: aLookup root receiver -> aLookup selector
		           ifAbsentPut: [ 
		           TypInfAstContext self: aLookup root receiver ].
	^ aLookup receiver classDescription >> aLookup selector 
		  typInfTypeIn: context
]
