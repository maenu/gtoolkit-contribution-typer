Class {
	#name : #TypShaShadow,
	#superclass : #Object,
	#instVars : [
		'priority'
	],
	#classInstVars : [
		'priority',
		'instance'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new initialize ]
]

{ #category : #accessing }
TypShaShadow class >> priority [
	^ priority ifNil: [ priority := 0 ]
]

{ #category : #accessing }
TypShaShadow class >> priority: anObject [
	priority := anObject
]

{ #category : #initialization }
TypShaShadow class >> reset [
	<script>
	instance := nil.
	priority := nil
]

{ #category : #initialization }
TypShaShadow class >> resetAll [
	<script>
	self allSubclassesDo: #reset
]

{ #category : #accessing }
TypShaShadow class >> resolveMethod: aLookup [
	^ self class methods
		select: [ :e | e typShaResolvesMethod: aLookup selector ]
		thenCollect: [ :e | 
			(self perform: e selector with: aLookup)
				addOrigin: (TypLookupOrigin lookup: aLookup);
				addOrigin: (TypShaMethodOrigin method: self class >> e selector);
				yourself ]
]

{ #category : #accessing }
TypShaShadow class >> resolveType: aLookup [
	^ aLookup classDescription typAsNamedType
]

{ #category : #accessing }
TypShaShadow class >> resolveVariable: aLookup [
	^ self class methods
		select: [ :e | e typShaResolvesVariable: aLookup selector ]
		thenCollect: [ :e | 
			(self perform: e selector with: aLookup)
				addOrigin: (TypLookupOrigin lookup: aLookup);
				addOrigin: (TypShaMethodOrigin method: self class >> e selector);
				yourself ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typPraResult: 'MetaClass'>
	self subclassResponsibility
]

{ #category : #initialization }
TypShaShadow >> initialize [
	super initialize.
	priority := 0
]

{ #category : #accessing }
TypShaShadow >> priority [
	^ priority
]

{ #category : #accessing }
TypShaShadow >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
TypShaShadow >> resolveMethod: aLookup [
	^ self class methods
		select: [ :e | e typShaResolvesMethod: aLookup selector ]
		thenCollect: [ :e | 
			(self perform: e selector with: aLookup)
				addOrigin: (TypLookupOrigin lookup: aLookup);
				addOrigin: (TypShaMethodOrigin method: self class >> e selector);
				yourself ]
]

{ #category : #converting }
TypShaShadow >> resolveType: aLookup [
	^ aLookup classDescription typAsNamedType
]

{ #category : #accessing }
TypShaShadow >> resolveVariable: aLookup [
	^ self class methods
		select: [ :e | e typShaResolvesVariable: aLookup selector ]
		thenCollect: [ :e | 
			(self perform: e selector with: aLookup)
				addOrigin: (TypLookupOrigin lookup: aLookup);
				addOrigin: (TypShaMethodOrigin method: self class >> e selector);
				yourself ]
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typPraResult: 'Class'>
	^ self class shadowedClass instanceSide
]
