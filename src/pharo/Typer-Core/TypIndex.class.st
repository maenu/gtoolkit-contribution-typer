Class {
	#name : #TypIndex,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypIndex class >> hasInstance [
	^ instance isNotNil
]

{ #category : #accessing }
TypIndex class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypIndex class >> invalidate [
	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypIndex class >> invalidateAll [
	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #accessing }
TypIndex class >> typGtInstanceFor: aView [
	<gtClassView>
	<gtView>
	instance ifNil: [ ^ aView empty ].
	^ aView explicit
		title: 'Instance';
		priority: -1;
		stencil: [ GtInspectorTool forObject: instance ]
]

{ #category : #accessing }
TypIndex >> cache [
	^ cache
]

{ #category : #accessing }
TypIndex >> completeness [
	^ OrderedCollection streamContents: [ :s | self completenessOn: s ]
]

{ #category : #accessing }
TypIndex >> completenessOn: aStream [
	self subclassResponsibility
]

{ #category : #accessing }
TypIndex >> correctness [
	^ OrderedCollection streamContents: [ :s | self correctnessOn: s ]
]

{ #category : #accessing }
TypIndex >> correctnessOn: aStream [
	self subclassResponsibility
]

{ #category : #invalidation }
TypIndex >> dependsOnClassDescription: aClassDescription [
	| resolver |
	cache
		keysAndValuesRemove: [ :c :l | l dependsOnClassDescription: aClassDescription ].
	^ resolver dependsOnClassDescription: aClassDescription
]

{ #category : #invalidation }
TypIndex >> dependsOnCompiledMethod: aCompiledMethod [
	| resolver |
	cache
		keysAndValuesRemove: [ :c :l | l dependsOnCompiledMethod: aCompiledMethod ].
	^ resolver dependsOnCompiledMethod: aCompiledMethod
]

{ #category : #accessing }
TypIndex >> initialize [
	super initialize.
	cache := IdentityDictionary new
]

{ #category : #accessing }
TypIndex >> invalidate [
	cache removeAll
]
