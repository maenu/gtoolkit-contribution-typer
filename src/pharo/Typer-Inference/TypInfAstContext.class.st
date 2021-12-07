Class {
	#name : #TypInfAstContext,
	#superclass : #Object,
	#instVars : [
		'selfType',
		'nodes'
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
	nodes := WeakIdentityKeyDictionary new
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

{ #category : #'as yet unclassified' }
TypInfAstContext >> nil: aNode [

	^ nodes at: aNode ifAbsentPut: [ 
		  (TypInfAstNode node: aNode)
			  addDependent: (aNode typInfAnnotated: TypNilType new)
			  label: #typInfNil ]
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

	^ nodes at: aNode ifAbsentPut: [ 
		  self unknown: aNode.
		  (TypInfAstNode node: aNode)
			  addDependent:
			  (aNode typInfAnnotated: (aNode typInfTypeRecursiveIn: self))
			  label: #typInfTypeRecursive ]
]

{ #category : #accessing }
TypInfAstContext >> unknown: aNode [

	^ nodes at: aNode ifAbsentPut: [ 
		  (TypInfAstNode node: aNode)
			  addDependent: (aNode typInfAnnotated: TypUnknownType new)
			  label: #typInfUnknown ]
]
