Class {
	#name : #TypInfAstContext,
	#superclass : #Object,
	#instVars : [
		'selfType',
		'nodes',
		'methods'
	],
	#category : #'Typer-Inference'
}

{ #category : #'as yet unclassified' }
TypInfAstContext class >> self: aType [

	^ self new
		  initializeSelf: aType;
		  yourself
]

{ #category : #initialization }
TypInfAstContext >> initialize [

	super initialize.
	nodes := IdentityDictionary new.
	methods := IdentityDictionary new
]

{ #category : #initialization }
TypInfAstContext >> initializeSelf: aType [

	selfType := aType
]

{ #category : #utilities }
TypInfAstContext >> methodAt: aNode [

	^ methods at: aNode ifAbsent: [ self unknown: aNode ]
]

{ #category : #utilities }
TypInfAstContext >> methodAt: aNode ifAbsentPut: aBlock [

	^ methods at: aNode ifAbsentPut: [ 
		  methods at: aNode put: (self unknown: aNode).
		  aBlock value ]
]

{ #category : #'as yet unclassified' }
TypInfAstContext >> nil: aNode [

	^ nodes at: aNode put: ((TypInfAstNode node: aNode)
			   addDependent: (aNode typInfAnnotated: TypNilType new)
			   label: #typInfNil)
]

{ #category : #utilities }
TypInfAstContext >> nodeAt: aNode [

	^ nodes at: aNode ifAbsent: [ self unknown: aNode ]
]

{ #category : #utilities }
TypInfAstContext >> nodeAt: aNode ifAbsentPut: aBlock [

	^ nodes at: aNode ifAbsentPut: [ 
		  nodes at: aNode put: (self unknown: aNode).
		  aBlock value ]
]

{ #category : #'as yet unclassified' }
TypInfAstContext >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfAstContext >> unknown: aNode [

	^ nodes at: aNode put: ((TypInfAstNode node: self)
			   addDependent: (aNode typInfAnnotated: TypUnknownType new)
			   label: #typInfUnknown)
]
