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
	^ aClass typAsNamedType
		initializeSuperTypeWithBindings:
			{('@B' -> Symbol typAsType).
			('@A'
				->
					{Class typAsType.
					TypUnknownType instance} typAsType)} asDictionary;
		yourself
]
