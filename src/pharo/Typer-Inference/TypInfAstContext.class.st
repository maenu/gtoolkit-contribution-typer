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

	| data |
	data := TypEdgePragmaData
		        selector: thisContext selector
		        arguments: thisContext arguments.
	outgoing
		detect: [ :e | e data = data ]
		ifFound: [ :e | ^ e target ]
		ifNone: [ 
			| node type |
			self outgoingAt: data ensure: TypUnknownType instance.
			type := aNode typInfAnnotated: (aNode typInfTypeRecursiveIn: self).
			self outgoingAt: data ensure: type.
			node := TypInfAstNode node: aNode.
			self outgoingAt: aNode ensure: node.
			node outgoingAt: #type ensure: type.
			^ type ]
]

{ #category : #accessing }
TypInfAstContext >> unknown: aNode [

	<typEdge>
	^ aNode typInfAnnotated: TypUnknownType instance
]
