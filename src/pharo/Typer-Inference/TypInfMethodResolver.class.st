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
	
	self flag: 'TODO be more clever'.
	"
	cache keysAndValuesRemove: [ :lookup :type | 
		(lookup invalidateOnClass: aClassAnnouncement) or: [ 
			type invalidateOnClass: aClassAnnouncement ] ]
	"
	contexts removeAll
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'TODO be more clever'.
	"
	cache keysAndValuesRemove: [ :lookup :type | 
		(lookup invalidateOnMethod: aMethodAnnouncement) or: [ 
			type invalidateOnMethod: aMethodAnnouncement ] ]
	"
	contexts removeAll
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
