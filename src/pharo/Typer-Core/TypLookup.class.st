Class {
	#name : #TypLookup,
	#superclass : #Object,
	#instVars : [
		'resolver',
		'parent',
		'child',
		'result'
	],
	#classInstVars : [
		'index',
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookup class >> index [
	^ index ifNil: [ index := Dictionary new ]
]

{ #category : #accessing }
TypLookup class >> invalidate [
	<script>
	index := nil.
	resolver := nil
]

{ #category : #accessing }
TypLookup class >> invalidateAll [
	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #accessing }
TypLookup >> < aLookup [
	^ aLookup > self
]

{ #category : #accessing }
TypLookup >> <= aLookup [
	^ aLookup >= self
]

{ #category : #accessing }
TypLookup >> = anObject [
	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	^ anObject parent = parent
]

{ #category : #accessing }
TypLookup >> > aLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> >= aLookup [
	^ self > aLookup or: [ self = aLookup ]
]

{ #category : #copying }
TypLookup >> asParent [
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> canResolve [
	self subclassResponsibility
]

{ #category : #invalidation }
TypLookup >> dependsOnClassDescription: aClassDescription [
	^ false
]

{ #category : #invalidation }
TypLookup >> dependsOnCompiledMethod: aCompiledMethod [
	^ false
]

{ #category : #testing }
TypLookup >> hasParent [
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> hash [
	^ parent hash
]

{ #category : #accessing }
TypLookup >> initializeParent: aLookup [
	self assert: [ parent isNil ].
	parent := aLookup
]

{ #category : #accessing }
TypLookup >> isResolved [
	^ resolver isNotNil
]

{ #category : #accessing }
TypLookup >> parent [
	^ parent
]

{ #category : #accessing }
TypLookup >> printOn: aStream [

	parent ifNil: [ ^ self ].
	aStream nextPutAll: ' | '.
	parent printOn: aStream
]

{ #category : #accessing }
TypLookup >> resolve [
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> resolveTo: aType by: aResolver [
	self assert: [ aType isNotNil ].
	self assert: [ aType isKindOf: TypType ].
	result := aType.
	resolver := aResolver
]

{ #category : #accessing }
TypLookup >> resolver [
	^ resolver
]

{ #category : #accessing }
TypLookup >> result [
	result ifNotNil: [ ^ result ].
	self resolve.
	^ result
]

{ #category : #accessing }
TypLookup >> resultOrUnknown [
	^ self result ifNil: [ TypUnknownType instance ]
]

{ #category : #accessing }
TypLookup >> root [
	^ parent ifNil: self ifNotNil: #root
]

{ #category : #accessing }
TypLookup >> updateTo: aType by: aResolver [
	self assert: [ aType isKindOf: TypType ].
	self assert: [ result isNotNil ].
	self assert: [ resolver isNotNil ].
	self assert: [ resolver == aResolver ].
	result := aType
]
