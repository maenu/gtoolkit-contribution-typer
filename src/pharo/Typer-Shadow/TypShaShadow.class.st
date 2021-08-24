Class {
	#name : #TypShaShadow,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaShadow class >> canResolveMethod: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #accessing }
TypShaShadow class >> canResolveType: aLookup [
	^ self class includesSelector: #resolveType:
]

{ #category : #accessing }
TypShaShadow class >> canResolveVariable: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesVariable: aLookup selector ]
]

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new initialize ]
]

{ #category : #initialization }
TypShaShadow class >> reset [
	<script>
	instance := nil
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
			  (self perform: e selector with: aLookup) copyWithOrigins: { 
					  (TypLookupOrigin lookup: aLookup).
					  (TypShaMethodOrigin method: self class >> e selector) } ]
]

{ #category : #accessing }
TypShaShadow class >> resolveType: aLookup [
	^ aLookup root classDescription typAsNamedType
]

{ #category : #accessing }
TypShaShadow class >> resolveVariable: aLookup [

	^ self class methods
		  select: [ :e | e typShaResolvesVariable: aLookup selector ]
		  thenCollect: [ :e | 
			  (self perform: e selector with: aLookup) copyWithOrigins: { 
					  (TypLookupOrigin lookup: aLookup).
					  (TypShaMethodOrigin method: self class >> e selector) } ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typPraResult: 'MetaClass'>
	self subclassResponsibility
]

{ #category : #accessing }
TypShaShadow >> canResolveMethod: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #accessing }
TypShaShadow >> canResolveType: aLookup [
	^ self class includesSelector: #resolveType:
]

{ #category : #accessing }
TypShaShadow >> canResolveVariable: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesVariable: aLookup selector ]
]

{ #category : #accessing }
TypShaShadow >> resolveMethod: aLookup [

	^ self class methods
		  select: [ :e | e typShaResolvesMethod: aLookup selector ]
		  thenCollect: [ :e | 
			  (self perform: e selector with: aLookup) copyWithOrigins: { 
					  (TypLookupOrigin lookup: aLookup).
					  (TypShaMethodOrigin method: self class >> e selector) } ]
]

{ #category : #converting }
TypShaShadow >> resolveType: aLookup [
	^ aLookup root classDescription typAsNamedType
]

{ #category : #accessing }
TypShaShadow >> resolveVariable: aLookup [

	^ self class methods
		  select: [ :e | e typShaResolvesVariable: aLookup selector ]
		  thenCollect: [ :e | 
			  (self perform: e selector with: aLookup) copyWithOrigins: { 
					  (TypLookupOrigin lookup: aLookup).
					  (TypShaMethodOrigin method: self class >> e selector) } ]
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typPraResult: 'Class'>
	^ self class shadowedClass instanceSide
]
