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
	| type |
	type := super asType: aClass.
	type
		superType:
			(type superType
				copyWithBindings:
					{('@B' -> Symbol typAsType).
					('@A'
						->
							{Class typAsType.
							TypUnknownType instance} typAsType)} asOrderedDictionary).
	^ type
]
