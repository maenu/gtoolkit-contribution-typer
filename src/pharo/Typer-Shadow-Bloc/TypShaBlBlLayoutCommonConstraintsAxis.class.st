Class {
	#name : #TypShaBlBlLayoutCommonConstraintsAxis,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlLayoutCommonConstraintsAxis class >> shadowedClass [
	^ BlLayoutCommonConstraintsAxis class
]

{ #category : #shadow }
TypShaBlBlLayoutCommonConstraintsAxis >> mExact: aLookup [
	<typShaMethod: 'exact:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]
