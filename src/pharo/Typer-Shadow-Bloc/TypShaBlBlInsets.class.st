Class {
	#name : #TypShaBlBlInsets,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #shadow }
TypShaBlBlInsets class >> mTopRightBottomLeft: aLookup [
	<typShaMethod: 'top:right:bottom:left:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Number typAsType}
]

{ #category : #'as yet unclassified' }
TypShaBlBlInsets class >> shadowedClass [
	^ BlInsets class
]
