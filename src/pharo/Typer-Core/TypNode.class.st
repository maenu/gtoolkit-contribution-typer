Class {
	#name : #TypNode,
	#superclass : #Object,
	#instVars : [
		'in',
		'out'
	],
	#category : #'Typer-Core-Graph'
}

{ #category : #compiler }
TypNode class >> compiler [

	^ super compiler addPlugin: TypEdgePragmaCompilerPlugin
]

{ #category : #invalidation }
TypNode class >> invalidateAll [

	<script>
	^ self allSubInstancesDo: #invalidate
]

{ #category : #testing }
TypNode class >> isAbstract [

	^ self == TypNode
]

{ #category : #accessing }
TypNode >> edges [
	^ (in values flatCollect: #yourself) , (out flatCollect: #yourself)
]

{ #category : #accessing }
TypNode >> in [

	^ in
]

{ #category : #accessing }
TypNode >> in: anObject [

	^ (in at: anObject) anyOne
]

{ #category : #accessing }
TypNode >> inAdd: anEdge [

	self assert: [ anEdge origin outIncludes: anEdge ].
	in
		at: anEdge key
		ifPresent: [ :e | 
			e add: anEdge.
			e ]
		ifAbsentPut: [ IdentitySet with: anEdge ]
]

{ #category : #accessing }
TypNode >> inAddOrigin: aNode key: anObject [

	aNode outAddTarget: self key: anObject.
	^ aNode
]

{ #category : #converting }
TypNode >> inAt: anObject [

	^ (self in: anObject) origin
]

{ #category : #converting }
TypNode >> inAt: anObject ifAbsentPut: aBlock [

	^ self inAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> inAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ in
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne origin ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypNode >> inAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ in
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne origin ]
		  ifAbsent: [ 
		  anotherBlock value outAddTarget: self key: anObject ]
]

{ #category : #converting }
TypNode >> inAt: anObject put: aNode [

	in at: anObject ifPresent: [ :c | 
		c ifNotEmpty: [ 
			| e |
			e := c anyOne.
			e origin = aNode ifTrue: [ ^ aNode ].
			e origin outRemove: e ] ].
	^ self inAddOrigin: aNode key: anObject
]

{ #category : #accessing }
TypNode >> inEdges [

	^ in values flatCollect: #yourself
]

{ #category : #testing }
TypNode >> inIncludes: anEdge [

	^ in
		  at: anEdge key
		  ifPresent: [ :e | e includes: anEdge ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypNode >> inRemove: anEdge [

	self assert: [ (anEdge origin outIncludes: anEdge) not ].
	in
		at: anEdge key
		ifPresent: [ :e | 
			e remove: anEdge.
			e ifEmpty: [ in removeKey: anEdge key ] ]
		ifAbsent: [ "noop" ]
]

{ #category : #accessing }
TypNode >> inRemoveAt: anObject [

	in
		at: anObject
		ifPresent: [ :e | e copy do: [ :f | f origin outRemove: f ] ]
]

{ #category : #accessing }
TypNode >> initialize [

	<typPraVariable: 'in' as: 'IdentityDictionary<?,IdentitySet<TypEdge>>'>
	<typPraVariable: 'out' as: 'IdentityDictionary<?,IdentitySet<TypEdge>>'>
	super initialize.
	in := IdentityDictionary new.
	out := IdentityDictionary new
]

{ #category : #invalidation }
TypNode >> invalidate [

	in removeAll.
	out removeAll
]

{ #category : #invalidation }
TypNode >> invalidateOnClassChange: aClassAnnouncement [

	^ false
]

{ #category : #invalidation }
TypNode >> invalidateOnMethodChange: aMethodAnnouncement [

	^ false
]

{ #category : #accessing }
TypNode >> neighbors [

	^ (self outEdges collect: #target as: IdentitySet)
	  , (self inEdges collect: #origin as: IdentitySet)
]

{ #category : #accessing }
TypNode >> out [

	^ out
]

{ #category : #accessing }
TypNode >> out: anObject [

	^ (out at: anObject) anyOne
]

{ #category : #accessing }
TypNode >> outAdd: anEdge [
	self assert: [ anEdge origin == self ].
	out
		at: anEdge key
		ifPresent: [ :s | s add: anEdge ]
		ifAbsentPut: [ IdentitySet with: anEdge ].
	anEdge target inAdd: anEdge.
	^ anEdge
]

{ #category : #accessing }
TypNode >> outAddTarget: aNode key: anObject [

	self outAdd: (TypEdge origin: self target: aNode key: anObject).
	^ aNode
]

{ #category : #converting }
TypNode >> outAt: anObject [

	^ (self out: anObject) target
]

{ #category : #converting }
TypNode >> outAt: anObject ifAbsent: aBlock [

	^ self outAt: anObject ifPresent: #yourself ifAbsent: aBlock
]

{ #category : #converting }
TypNode >> outAt: anObject ifAbsentPut: aBlock [

	^ self outAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> outAt: anObject ifPresent: aBlock [
	^ out
		at: anObject
		ifPresent: [ :e | aBlock cull: e anyOne target ]
		ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypNode >> outAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ out
		  at: anObject
		  ifPresent: [ :e | aBlock cull: e anyOne target ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypNode >> outAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ out
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne target ]
		  ifAbsent: [ 
		  self outAddTarget: anotherBlock value key: anObject ]
]

{ #category : #converting }
TypNode >> outAt: anObject put: aNode [

	out at: anObject ifPresent: [ :c | 
		c ifNotEmpty: [ 
			| e |
			e := c anyOne.
			e target = aNode ifTrue: [ ^ aNode ].
			self outRemove: e ] ].
	^ self outAddTarget: aNode key: anObject
]

{ #category : #accessing }
TypNode >> outEdges [

	^ out values flatCollect: #yourself
]

{ #category : #testing }
TypNode >> outIncludes: anEdge [

	^ out
		  at: anEdge key
		  ifPresent: [ :e | e includes: anEdge ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypNode >> outRemove: anEdge [
	out
		at: anEdge key
		ifPresent: [ :e | 
			e remove: anEdge.
			e ifEmpty: [ out removeKey: anEdge key ] ]
		ifAbsent: [ Halt now ].
	^ anEdge target
		inRemove: anEdge;
		yourself
]

{ #category : #accessing }
TypNode >> outRemoveAt: anObject [
	^ out at: anObject ifPresent: [ :e | e copy do: [ :f | self outRemove: f ] ]
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	in := IdentityDictionary new.
	out := IdentityDictionary new
]
