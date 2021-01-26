Class {
	#name : #TypShaPhaSystemAnnouncer,
	#superclass : #TypShaShadow,
	#classInstVars : [
		'___announcer'
	],
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaSystemAnnouncer class >> initialize [
	___announcer := SystemAnnouncer typAsType
]

{ #category : #'as yet unclassified' }
TypShaPhaSystemAnnouncer class >> shadowedClass [
	^ SystemAnnouncer class
]
