Class {
	#name : #TypInfNode,
	#superclass : #Object,
	#instVars : [
		'node',
		'state',
		'context',
		'iterations',
		'out',
		'in'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNode class >> invalidate [
	
]

{ #category : #accessing }
TypInfNode class >> invalidateAll [
	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #accessing }
TypInfNode class >> node: aNode context: aContext [
	^ self new
		initializeNode: aNode context: aContext;
		yourself
]

{ #category : #accessing }
TypInfNode >> allNextNodes [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | result add: n ].
	^ result
]

{ #category : #accessing }
TypInfNode >> constrain: aNode to: aType [
	state at: aNode covariantPut: aType.
	aNode constrainTo: aType from: self
]

{ #category : #accessing }
TypInfNode >> constrainTo: aType from: aNode [
	| edge |
	aType isUnknown ifTrue: [ ^ self ].
	edge := aNode out
			at: #constrain
			ifPresent: [ :s | 
				s
					detect: [ :e | e target = self ]
					ifNone: [ aNode outAdd: (TypInfConstrainEdge origin: aNode target: self) ] ]
			ifAbsent: [ aNode outAdd: (TypInfConstrainEdge origin: aNode target: self) ].
	edge type: aType
]

{ #category : #accessing }
TypInfNode >> context [

	^ context
]

{ #category : #accessing }
TypInfNode >> covariantPut: aType [
	^ state at: self covariantPut: aType
]

{ #category : #accessing }
TypInfNode >> depthFirstNextDo: aBlock [
	^ self depthFirstNextDo: aBlock skipping: IdentitySet new
]

{ #category : #accessing }
TypInfNode >> depthFirstNextDo: aBlock skipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ self ].
	anIdentitySet add: self.
	aBlock value: self.
	out
		at: #next
		ifPresent: [ :c | c do: [ :e | e target depthFirstNextDo: aBlock skipping: anIdentitySet ] ]
]

{ #category : #accessing }
TypInfNode >> depthFirstNextReverseDo: aBlock [
	^ self depthFirstNextReverseDo: aBlock skipping: IdentitySet new
]

{ #category : #accessing }
TypInfNode >> depthFirstNextReverseDo: aBlock skipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ self ].
	anIdentitySet add: self.
	aBlock value: self.
	in
		at: #next
		ifPresent: [ :c | c do: [ :e | e origin depthFirstNextReverseDo: aBlock skipping: anIdentitySet ] ]
]

{ #category : #accessing }
TypInfNode >> edges [
	^ ((in values flatCollect: #yourself) , (out flatCollect: #yourself))
		asIdentitySet
]

{ #category : #accessing }
TypInfNode >> in [

	^ in
]

{ #category : #accessing }
TypInfNode >> in: anObject [

	^ (in at: anObject) anyOne
]

{ #category : #accessing }
TypInfNode >> inAdd: anEdge [

	self assert: [ anEdge origin outIncludes: anEdge ].
	in
		at: anEdge key
		ifPresent: [ :e | 
			e add: anEdge.
			e ]
		ifAbsentPut: [ IdentitySet with: anEdge ]
]

{ #category : #accessing }
TypInfNode >> inAddOrigin: aNode key: anObject [
	aNode outAddTarget: self key: anObject.
	^ aNode
]

{ #category : #converting }
TypInfNode >> inAt: anObject [

	^ (self in: anObject) origin
]

{ #category : #converting }
TypInfNode >> inAt: anObject ifAbsentPut: aBlock [

	^ self inAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypInfNode >> inAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ in
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne origin ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfNode >> inAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [
	^ in
		at: anObject
		ifPresent: [ :e | aBlock value: e anyOne origin ]
		ifAbsent: [ anotherBlock value outAddTarget: self key: anObject ]
]

{ #category : #converting }
TypInfNode >> inAt: anObject put: aNode [

	in at: anObject ifPresent: [ :c | 
		c ifNotEmpty: [ 
			| e |
			e := c anyOne.
			e origin = aNode ifTrue: [ ^ aNode ].
			e origin outRemove: e ] ].
	^ self inAddOrigin: aNode key: anObject
]

{ #category : #accessing }
TypInfNode >> inEdges [

	^ in values flatCollect: #yourself
]

{ #category : #testing }
TypInfNode >> inIncludes: anEdge [

	^ in
		  at: anEdge key
		  ifPresent: [ :e | e includes: anEdge ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypInfNode >> inNexts [
	^ in
		at: #next
		ifPresent: [ :s | s reject: [ :e | e origin isDead ] thenCollect: #origin ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfNode >> inRemove: anEdge [

	self assert: [ (anEdge origin outIncludes: anEdge) not ].
	in
		at: anEdge key
		ifPresent: [ :e | 
			e remove: anEdge.
			e ifEmpty: [ in removeKey: anEdge key ] ]
		ifAbsent: [ "noop" ]
]

{ #category : #accessing }
TypInfNode >> inRemoveAt: anObject [

	in
		at: anObject
		ifPresent: [ :e | e copy do: [ :f | f origin outRemove: f ] ]
]

{ #category : #accessing }
TypInfNode >> initialize [
	<typPraVariable: 'in' as: 'IdentityDictionary<?,IdentitySet<TypInfEdge>>'>
	<typPraVariable: 'out' as: 'IdentityDictionary<?,IdentitySet<TypInfEdge>>'>
	super initialize.
	in := IdentityDictionary new.
	out := IdentityDictionary new
]

{ #category : #initialization }
TypInfNode >> initializeNode: aNode context: aContext [
	self assert: [ aContext state isNotNil ].
	node := aNode.
	context := aContext.
	state := aContext state copy.
	iterations := OrderedCollection
			new: TypInfCurrentConfiguration value maxIterations + 1
]

{ #category : #accessing }
TypInfNode >> isDead [
	self depthFirstNextReverseDo: [ :n | n == context root ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
TypInfNode >> isLeaf [
	^ self outNexts isEmpty
]

{ #category : #accessing }
TypInfNode >> isLeaf: aContext [
	(context stack includes: aContext) ifFalse: [ ^ false ].
	^ self outNexts noneSatisfy: [ :n | n context stack includes: aContext ]
]

{ #category : #accessing }
TypInfNode >> iterations [
	^ context home iterations
		collect: [ :c | 
			c
				at: self
				"ifPresent: [ :cc | cc at: self ifAbsent: {} ]"
				ifAbsent: {} ]
]

{ #category : #accessing }
TypInfNode >> leaves [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | n isLeaf ifTrue: [ result add: n ] ].
	^ result
]

{ #category : #accessing }
TypInfNode >> leaves: aContext [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | (n isLeaf: aContext) ifTrue: [ result add: n ] ].
	^ result
]

{ #category : #accessing }
TypInfNode >> neighbors [

	^ (self outEdges collect: #target as: IdentitySet)
	  , (self inEdges collect: #origin as: IdentitySet)
]

{ #category : #accessing }
TypInfNode >> newMethodLookups: aMessage [
	^ aMessage receiver types
		collect: [ :t | 
			TypMethodLookup
				receiver: t
				selector: aMessage selector
				arguments: aMessage arguments ]
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> out [

	^ out
]

{ #category : #accessing }
TypInfNode >> out: anObject [

	^ (out at: anObject) anyOne
]

{ #category : #accessing }
TypInfNode >> outAdd: anEdge [
	self assert: [ anEdge origin == self ].
	out
		at: anEdge key
		ifPresent: [ :s | s add: anEdge ]
		ifAbsentPut: [ IdentitySet with: anEdge ].
	anEdge target inAdd: anEdge.
	^ anEdge
]

{ #category : #accessing }
TypInfNode >> outAddTarget: aNode key: anObject [
	self
		outAdd: (TypInfEdge
				origin: self
				target: aNode
				key: anObject).
	^ aNode
]

{ #category : #converting }
TypInfNode >> outAt: anObject [

	^ (self out: anObject) target
]

{ #category : #converting }
TypInfNode >> outAt: anObject ifAbsent: aBlock [

	^ self outAt: anObject ifPresent: #yourself ifAbsent: aBlock
]

{ #category : #converting }
TypInfNode >> outAt: anObject ifAbsentPut: aBlock [

	^ self outAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypInfNode >> outAt: anObject ifPresent: aBlock [
	^ out
		at: anObject
		ifPresent: [ :e | aBlock cull: e anyOne target ]
		ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypInfNode >> outAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ out
		  at: anObject
		  ifPresent: [ :e | aBlock cull: e anyOne target ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfNode >> outAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [
	^ out
		at: anObject
		ifPresent: [ :e | aBlock value: e anyOne target ]
		ifAbsent: [ self outAddTarget: anotherBlock value key: anObject ]
]

{ #category : #converting }
TypInfNode >> outAt: anObject put: aNode [
	out
		at: anObject
		ifPresent: [ :c | 
			c
				ifNotEmpty: [ | e |
					e := c anyOne.
					e target = aNode ifTrue: [ ^ aNode ].
					self outRemove: e ] ].
	^ self outAddTarget: aNode key: anObject
]

{ #category : #accessing }
TypInfNode >> outEdges [

	^ out values flatCollect: #yourself
]

{ #category : #testing }
TypInfNode >> outIncludes: anEdge [

	^ out
		  at: anEdge key
		  ifPresent: [ :e | e includes: anEdge ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypInfNode >> outNexts [
	^ out
		at: #next
		ifPresent: [ :s | s collect: #target ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfNode >> outRemove: anEdge [
	out
		at: anEdge key
		ifPresent: [ :e | 
			e remove: anEdge.
			e ifEmpty: [ out removeKey: anEdge key ] ]
		ifAbsent: [ ^ anEdge target ].
	^ anEdge target
		inRemove: anEdge;
		yourself
]

{ #category : #accessing }
TypInfNode >> outRemoveAt: anObject [
	^ out at: anObject ifPresent: [ :e | e copy do: [ :f | self outRemove: f ] ]
]

{ #category : #accessing }
TypInfNode >> postCopy [

	super postCopy.
	in := IdentityDictionary new.
	out := IdentityDictionary new
]

{ #category : #accessing }
TypInfNode >> previous [
	^ ((in at: #next)
		reject: [ :e | e origin isDead ]
		thenCollect: [ :e | state at: e origin ifAbsent: [  "happens for recursion"e origin type ] ])
		typAsMinimizedType
]

{ #category : #printing }
TypInfNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #accessing }
TypInfNode >> put: aType [
	^ state at: self put: aType
]

{ #category : #accessing }
TypInfNode >> reduceTo: aCollection [
	| newState |
	1 to: iterations size - 1 do: [ :i | iterations at: i put: nil ].
	newState := TypInfDictionaryState new: aCollection size.
	aCollection
		keysAndValuesDo: [ :n | state at: n ifPresent: [ :t | newState at: n put: t ] ].
	state := newState
]

{ #category : #accessing }
TypInfNode >> slurp [
	in
		at: #next
		ifPresent: [ :s | state slurpAll: (s collect: [ :e | e origin state ]) ].
	in at: #constrain ifPresent: [ :s | s do: [ :e | self covariantPut: e type ] ].
	out at: #constrain ifPresent: [ :s | s copy do: #remove ]
]

{ #category : #accessing }
TypInfNode >> slurpAndTransfer [
	TypInfNodeSlurpAndTransferSignal emit: self.
	self
		slurp;
		transfer.
	^ iterations add: state changes
]

{ #category : #accessing }
TypInfNode >> state [
	^ state
]

{ #category : #accessing }
TypInfNode >> transfer [
	"transfer the given state from in to out"

	
]

{ #category : #accessing }
TypInfNode >> type [
	^ state at: self ifAbsent: [ TypUnknownType instance ]
]

{ #category : #accessing }
TypInfNode >> unconstrain: aNode [
	aNode unconstrainFrom: self
]

{ #category : #accessing }
TypInfNode >> unconstrainFrom: aNode [
	aNode out
		at: #constrain
		ifPresent: [ :s | s select: [ :e | e target = self ] thenDo: #remove ]
]

{ #category : #accessing }
TypInfNode >> uninstall [
	self flag: 'TODO sounds expensive'.
	self edges do: #remove
]
