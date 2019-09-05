Class {
	#name : #TypCachingResolver,
	#superclass : #TypResolver,
	#instVars : [
		'cache',
		'selector'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypCachingResolver >> invalidate [
	self flag: 'FIXME invalidate on class add/remove'.
	cache := ((Smalltalk allClasses
		flatCollect: [ :e | 
			{e.
			e class} ])
		collect: [ :e | e name asSymbol -> (e perform: selector) ])
		as: IdentityDictionary
]

{ #category : #accessing }
TypCachingResolver >> selector [
	^ selector
]

{ #category : #accessing }
TypCachingResolver >> selector: anObject [
	selector := anObject.
	self invalidate
]
