Class {
	#name : #TypShaPhaAnnouncement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaAnnouncement class >> shadowedClass [
	^ Announcement class
]

{ #category : #accessing }
TypShaPhaAnnouncement class >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Announcement class typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]
