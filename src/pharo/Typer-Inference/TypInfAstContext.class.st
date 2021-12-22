Class {
	#name : #TypInfAstContext,
	#superclass : #Object,
	#instVars : [
		'selfType',
		'nodes',
		'unknown',
		'null'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Inference'
}

{ #category : #initialization }
TypInfAstContext class >> initialize [

	"weak reference to indexed types ensures eventual consistency "

	index := WeakIdentityKeyDictionary new
]

{ #category : #invalidation }
TypInfAstContext class >> invalidate [

	index ifNotNil: #removeAll
]

{ #category : #'as yet unclassified' }
TypInfAstContext class >> self: aType [

	^ index at: aType ifAbsentPut: [ 
		  self new
			  initializeSelf: aType;
			  yourself ]
]

{ #category : #initialization }
TypInfAstContext >> initialize [

	super initialize.
	nodes := WeakIdentityKeyDictionary new.
	unknown := TypUnknownType instance.
	null := TypNilType instance
]

{ #category : #initialization }
TypInfAstContext >> initializeSelf: aType [

	selfType := aType
]

{ #category : #accessing }
TypInfAstContext >> isAffectedByClassChange: aClassAnnouncement [

	^ selfType <= aClassAnnouncement classAffected typAsType
]

{ #category : #accessing }
TypInfAstContext >> isAffectedByMethodChange: aMethodAnnouncement [

	^ selfType <= aMethodAnnouncement methodAffected methodClass typAsType
]

{ #category : #accessing }
TypInfAstContext >> nil: aNode [

	^ nodes
		  at: aNode
		  ifAbsentPut: [ aNode typInfAnnotated: null ]
]

{ #category : #accessing }
TypInfAstContext >> printOn: aStream [

	selfType printOn: aStream
]

{ #category : #removing }
TypInfAstContext >> removeKey: aNode [

	nodes removeKey: aNode ifAbsent: [ "noop" ]
]

{ #category : #'as yet unclassified' }
TypInfAstContext >> self [

	^ selfType
]

{ #category : #utilities }
TypInfAstContext >> type: aNode [

	^ nodes at: aNode ifAbsent: [ 
		  nodes
			  at: aNode put: unknown;
			  at: aNode
			  put: (aNode typInfAnnotated: (aNode typInfTypeRecursiveIn: self)) ]
]

{ #category : #accessing }
TypInfAstContext >> unknown: aNode [

	^ nodes at: aNode ifAbsentPut: [ aNode typInfAnnotated: unknown ]
]
