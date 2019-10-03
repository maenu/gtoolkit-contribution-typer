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
	type superType bindings at: '@B' put: Symbol typAsType.
	type superType bindings
		at: '@A'
		put:
			{Class typAsType.
			TypUnknownType instance} typAsType.
	^ type
]
