Class {
	#name : #TypPraResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraResolvers >> cachedResolversFor: aLookup [
	self subclassResponsibility
]

{ #category : #initialization }
TypPraResolvers >> initialize [
	super initialize.
	self flag: 'FIXME invalidate on class add/remove'.
	self invalidate
]

{ #category : #initialization }
TypPraResolvers >> invalidate [
	cache := ((Smalltalk allClasses
		flatCollect: [ :e | 
			{e.
			e class} ]) flatCollect: self selector) asDictionary
]

{ #category : #accessing }
TypPraResolvers >> resolversFor: aLookup [
	^ ((self cachedResolversFor: aLookup)
		select: [ :e | e resolves: aLookup ])
		flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypPraResolvers >> resolves: aLookup [
	^ (self resolversFor: aLookup) isNotEmpty
]

{ #category : #accessing }
TypPraResolvers >> selector [
	self subclassResponsibility
]
