Class {
	#name : #TypShaGtGtCoderMethodAnnouncement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtCoderMethodAnnouncement class >> shadowedClass [
	^ GtCoderMethodAnnouncement class
]

{ #category : #shadow }
TypShaGtGtCoderMethodAnnouncement >> mCoder: aLookup [ 
	<typShaMethod: 'coder:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodsCoder typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
