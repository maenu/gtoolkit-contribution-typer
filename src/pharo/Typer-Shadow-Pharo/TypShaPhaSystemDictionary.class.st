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
	(type hasSuperType and: [ type superType isParametric ]) ifTrue: [ 
		type := type copyWithSuperType:
			        (type superType copyWithParameters: { 
					         Symbol typAsType.
					         { 
						         Class typAsType.
						         TypUnknownType instance } typAsType }) ].
	^ type
]
