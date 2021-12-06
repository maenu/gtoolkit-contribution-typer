Class {
	#name : #TypInfAstContext,
	#superclass : #Object,
	#instVars : [
		'selfType',
		'nodes'
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
TypInfAstContext >> isAffectedByMethodChange: aClassAnnouncement [

	^ selfType <= aClassAnnouncement classAffected typAsType
]

{ #category : #'as yet unclassified' }
TypInfAstContext >> nil: aNode [

	^ nodes at: aNode put: ((TypInfAstNode node: aNode)
			   addDependent: (aNode typInfAnnotated: TypNilType new)
			   label: #typInfNil)
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

	^ nodes at: aNode ifAbsentPut: [ 
		  nodes at: aNode put: (self unknown: aNode).
		  (TypInfAstNode node: aNode)
			  addDependent:
			  (aNode typInfAnnotated: (aNode typInfTypeRecursiveIn: self))
			  label: #typInfTypeRecursive ]
]

{ #category : #accessing }
TypInfAstContext >> unknown: aNode [

	^ nodes at: aNode put: ((TypInfAstNode node: aNode)
			   addDependent: (aNode typInfAnnotated: TypUnknownType new)
			   label: #typInfUnknown)
]
