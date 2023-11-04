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
TypIndex >> cache [
	^ cache
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
