Class {
	#name : #TypCachingResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingResolvers >> cachedResolversFor: aLookup [
	self subclassResponsibility
]

{ #category : #initialization }
TypCachingResolvers >> initialize [
	super initialize.
	self flag: 'FIXME invalidate on class add/remove'.
	self invalidate
]

{ #category : #initialization }
TypCachingResolvers >> invalidate [
	cache := ((Smalltalk allClasses
		flatCollect: [ :e | 
			{e.
			e class} ]) flatCollect: self selector) asDictionary
]

{ #category : #accessing }
TypCachingResolvers >> resolversFor: aLookup [
	^ ((self cachedResolversFor: aLookup)
		select: [ :e | e resolves: aLookup ])
		flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypCachingResolvers >> resolves: aLookup [
	^ (self resolversFor: aLookup) isNotEmpty
]

{ #category : #accessing }
TypCachingResolvers >> selector [
	self subclassResponsibility
]
