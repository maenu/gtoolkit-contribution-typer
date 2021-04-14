Class {
	#name : #TypShaPhaColor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaColor class >> mBlue: aLookup [
	<typShaMethod: 'blue'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mGreen: aLookup [
	<typShaMethod: 'green'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mOrange: aLookup [
	<typShaMethod: 'orange'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mPurple: aLookup [
	<typShaMethod: 'purple'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mRed: aLookup [
	<typShaMethod: 'red'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #shadow }
TypShaPhaColor class >> mVeryLightGray: aLookup [
	<typShaMethod: 'veryLightGray'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'as yet unclassified' }
TypShaPhaColor class >> shadowedClass [
	^ Color class
]

{ #category : #shadow }
TypShaPhaColor >> mAlpha: aLookup [
	<typShaMethod: 'alpha:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]
