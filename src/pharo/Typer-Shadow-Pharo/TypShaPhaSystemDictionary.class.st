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
TypShaPhaSystemDictionary >> asType: aClass [
	^ aClass == SystemDictionary
		ifTrue: [ | type |
			type := aClass typAsNamedType.
			type
				superType:
					(type superType
						copyWithParameters:
							{Symbol typAsType.
							{Class typAsType.
							TypUnknownType new} typAsType}).
			^ type ]
		ifFalse: [ aClass typAsNamedType ]
]
