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
	^ aClass
		typAsNamedTypeWithSuperTypeBindings:
			{('@B' typAsType -> Symbol typAsType).
			('@A'typAsType
				->
					{Class typAsType.
					TypUnknownType instance} typAsType)} typAsTypeVariableBindings
]
