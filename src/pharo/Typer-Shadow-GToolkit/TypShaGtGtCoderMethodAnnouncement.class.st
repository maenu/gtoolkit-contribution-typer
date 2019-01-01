Class {
	#name : #TypShaGtGtCoderMethodAnnouncement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtCoderMethodAnnouncement class >> shadowedClass [
	^ GtCoderMethodAnnouncement class
]

{ #category : #accessing }
TypShaGtGtCoderMethodAnnouncement >> ___coder: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | GtMethodsCoder typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
