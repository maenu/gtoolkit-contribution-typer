Class {
	#name : #TypShaPhaColor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaColor class >> mBlue: aLookup [
	<typShaMethod: 'blue'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mGreen: aLookup [
	<typShaMethod: 'green'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mOrange: aLookup [
	<typShaMethod: 'orange'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mPurple: aLookup [
	<typShaMethod: 'purple'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mRed: aLookup [
	<typShaMethod: 'red'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mVeryLightGray: aLookup [
	<typShaMethod: 'veryLightGray'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'as yet unclassified' }
TypShaPhaColor class >> shadowedClass [
	^ Color class
]

{ #category : #shadow }
TypShaPhaColor >> mAlpha: aLookup [
	<typShaMethod: 'alpha:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]
