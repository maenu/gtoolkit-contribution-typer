Class {
	#name : #TypInfAstContext,
	#superclass : #TypNode,
	#instVars : [
		'selfType'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Inference'
}

{ #category : #initialization }
TypInfAstContext class >> initialize [

	"weak reference to indexed types ensures eventual consistency "

	<script>
	index := WeakIdentityKeyDictionary new
]

{ #category : #invalidation }
TypInfAstContext class >> invalidate [

	<script>
	self initialize
]

{ #category : #'as yet unclassified' }
TypInfAstContext class >> self: aType [

	^ index at: aType ifAbsentPut: [ 
		  self new
			  initializeSelf: aType;
			  yourself ]
]

{ #category : #initialization }
TypInfAstContext >> initializeSelf: aType [

	selfType := aType
]

{ #category : #accessing }
TypInfAstContext >> invalidateOnClassChange: aClassAnnouncement [

	^ selfType <= aClassAnnouncement classAffected typAsType
]

{ #category : #accessing }
TypInfAstContext >> invalidateOnMethodChange: aMethodAnnouncement [

	^ selfType <= aMethodAnnouncement methodAffected methodClass typAsType
]

{ #category : #accessing }
TypInfAstContext >> nil: aNode [

	<typEdge>
	^ aNode typInfAnnotated: TypNilType instance
]

{ #category : #accessing }
TypInfAstContext >> printOn: aStream [

	selfType printOn: aStream
]

{ #category : #'as yet unclassified' }
TypInfAstContext >> self [

	^ selfType
]

{ #category : #utilities }
TypInfAstContext >> type: aNode [

	| node |
	node := TypInfAstNode node: aNode.
	^ self outgoingAt: node ifAbsentPut: [ 
		  self outgoingAt: node ensure: TypUnknownType instance.
		  node
			  outgoingAt: self
			  ensure:
			  (aNode typInfAnnotated: (aNode typInfTypeRecursiveIn: self)) ]
]

{ #category : #accessing }
TypInfAstContext >> unknown: aNode [

	<typEdge>
	^ aNode typInfAnnotated: TypUnknownType instance
]
