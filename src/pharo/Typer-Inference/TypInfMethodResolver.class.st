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
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and:
					[ aLookup receiver classDescription includesSelector: aLookup selector ] ]
]

{ #category : #initialization }
TypInfMethodResolver >> initialize [

	super initialize.
	contexts := Dictionary new
]

{ #category : #accessing }
TypInfMethodResolver >> invalidate [

	super invalidate.
	TypInfAstNode invalidate.
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
		class typAsType >= receiver or: [ 
			(association key isAffectedByClassChange: aClassAnnouncement) or: [ 
				context isAffectedByClassChange: aClassAnnouncement ] ] ]
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
			(association key isAffectedByMethodChange: aMethodAnnouncement) 
				or: [ context isAffectedByMethodChange: aMethodAnnouncement ] ] ]
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
