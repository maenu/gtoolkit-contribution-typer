Class {
	#name : #TypShaPhaSystemAnnouncer,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSystemAnnouncer class >> shadowedClass [
	^ SystemAnnouncer class
]

{ #category : #'as yet unclassified' }
TypShaPhaSystemAnnouncer class >> vAnnouncer: aLookup [
	<typShaVariable: #announcer>
	^ SystemAnnouncer typAsType
]
