Class {
	#name : #TypCachingResolver,
	#superclass : #TypResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingResolver >> cachedResolversFor: aLookup [
	self subclassResponsibility
]

{ #category : #initialization }
TypCachingResolver >> initialize [
	super initialize.
	self flag: 'FIXME invalidate on class add/remove'.
	self invalidate
]

{ #category : #initialization }
TypCachingResolver >> invalidate [
	cache := ((Smalltalk allClasses
		flatCollect: [ :e | 
			{e.
			e class} ]) flatCollect: self selector) asDictionary
]

{ #category : #accessing }
TypCachingResolver >> resolversFor: aLookup [
	^ ((self cachedResolversFor: aLookup)
		select: [ :e | e resolves: aLookup ])
		flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypCachingResolver >> resolves: aLookup [
	^ (self resolversFor: aLookup) isNotEmpty
]

{ #category : #accessing }
TypCachingResolver >> selector [
	self subclassResponsibility
]
