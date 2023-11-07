Class {
	#name : #TypLookup,
	#superclass : #Object,
	#instVars : [
		'resolver',
		'result',
		'resolved'
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
TypLookup class >> resolver [
	self subclassResponsibility
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
	^ self class resolver canResolve: self
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
TypLookup >> printOn: aStream [
	resolved ifNil: [ ^ self ].
	resolved == self ifTrue: [ ^ self ].
	aStream nextPutAll: ' | '.
	resolved printOn: aStream
]

{ #category : #accessing }
TypLookup >> resolve [
	resolved ifNotNil: [ ^ resolved ].
	self canResolve ifFalse: [ ^ self ].
	self class resolver resolve: self.
	^ resolved
]

{ #category : #accessing }
TypLookup >> resolved: aLookup resolver: aResolver [
	resolved := aLookup.
	resolver := aResolver
]

{ #category : #accessing }
TypLookup >> resolver [
	resolver ifNotNil: [ ^ resolver ].
	self resolve.
	^ resolver
]

{ #category : #accessing }
TypLookup >> result [
	result
		ifNotNil: [ ^ result := resolver
					result: resolved
					root: self
					update: result ].
	self resolve.
	resolver ifNil: [ ^ result ].
	^ result := resolver result: resolved root: self
]

{ #category : #accessing }
TypLookup >> resultOrUnknown [
	^ self result ifNil: [ TypUnknownType instance ]
]
