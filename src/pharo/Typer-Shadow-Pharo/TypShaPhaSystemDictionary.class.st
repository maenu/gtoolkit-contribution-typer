Class {
	#name : #TypShaPhaSystemDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSystemDictionary class >> shadowedClass [
	^ SystemDictionary class
]

{ #category : #accessing }
TypShaPhaSystemDictionary >> resolveType: aLookup [
	| type |
	type := aLookup root classDescription typAsNamedType.
	(type hasSuperType and: [ type superType isParametric ])
		ifTrue: [ type
				superType:
					(type superType
						copyWithParameters:
							{Symbol typAsType.
							{Class typAsType.
							TypUnknownType new} typAsType}) ].
	^ type
]
