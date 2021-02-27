Class {
	#name : #TypShaPhaAnnouncement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaAnnouncement class >> mBinary77: aLookup [
	<typShaMethod: ','>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {Announcement class typAsType}
]

{ #category : #'as yet unclassified' }
TypShaPhaAnnouncement class >> shadowedClass [
	^ Announcement class
]
