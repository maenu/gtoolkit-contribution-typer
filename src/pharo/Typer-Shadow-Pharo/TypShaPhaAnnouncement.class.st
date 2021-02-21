Class {
	#name : #TypShaPhaAnnouncement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaAnnouncement class >> mBinary77: aLookup [ 
	<typShaMethod: ','>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Announcement class typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAnnouncement class >> shadowedClass [
	^ Announcement class
]
