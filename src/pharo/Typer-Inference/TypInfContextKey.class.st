Class {
	#name : #TypInfContextKey,
	#superclass : #TypEdgeKey,
	#instVars : [
		'node',
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfContextKey class >> node: aNode self: aType super: anotherType [

	^ self index
		  at: { 
				  aNode identityHash.
				  aType.
				  anotherType }
		  ifAbsentPut: [ 
			  self new
				  initializeNode: aNode self: aType super: anotherType;
				  yourself ]
]

{ #category : #comparing }
TypInfContextKey >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject node == node ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
TypInfContextKey >> hash [

	^ (node identityHash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #initialization }
TypInfContextKey >> initializeNode: aNode self: aType super: anotherType [

	node := aNode.
	selfType := aType.
	superType := anotherType
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> invalidateOnClassChange: aClassAnnouncement in: anEdge [

	| changed |
	changed := false.
	selfType <= aClassAnnouncement classAffected typAsType ifTrue: [ 
		anEdge origin outgoingRemove: anEdge.
		changed := true ].
	^ changed or:
		  (anEdge target invalidateOnClassChange: aClassAnnouncement)
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> invalidateOnMethodChange: aMethodAnnouncement in: anEdge [

	| changed |
	changed := false.
	(selfType <= aMethodAnnouncement methodAffected methodClass typAsType 
		 and: [ node selector = aMethodAnnouncement methodAffected selector ]) 
		ifTrue: [ 
			anEdge origin outgoingRemove: anEdge.
			changed := true ].
	^ changed or:
		  (anEdge target invalidateOnMethodChange: aMethodAnnouncement)
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> node [

	^ node
]

{ #category : #accessing }
TypInfContextKey >> printOn: aStream [

	selfType printOn: aStream.
	aStream nextPut: Character space.
	superType printOn: aStream.
	aStream nextPut: Character space.
	node printOn: aStream
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> super [

	^ superType
]
