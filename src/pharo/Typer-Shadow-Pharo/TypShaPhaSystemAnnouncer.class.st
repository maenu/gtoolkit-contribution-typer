Class {
	#name : #TypShaPhaSystemAnnouncer,
	#superclass : #TypShaShadow,
	#classInstVars : [
		'___announcer'
	],
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSystemAnnouncer class >> initialize [
	___announcer := TypVariableLookupResult new
		type: [ :a :s :r | SystemAnnouncer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSystemAnnouncer class >> shadowedClass [
	^ SystemAnnouncer class
]
