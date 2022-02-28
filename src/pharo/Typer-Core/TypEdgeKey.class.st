Class {
	#name : #TypEdgeKey,
	#superclass : #Object,
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #initialization }
TypEdgeKey class >> index [

	^ index ifNil: [ index := WeakValueDictionary new ]
]

{ #category : #invalidation }
TypEdgeKey class >> invalidate [

	<script>
	index := nil
]

{ #category : #invalidation }
TypEdgeKey class >> invalidateAll [

	<script>
	self withAllSubclassesDo: #invalidate
]
