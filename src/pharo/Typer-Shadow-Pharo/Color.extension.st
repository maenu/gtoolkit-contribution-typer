Extension { #name : #Color }

{ #category : #'*Typer-Shadow-Pharo' }
Color >> typShaMethodKeywordAlpha: aLookup root: anotherLookup [
	<typShaMethod: 'alpha:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryBlue: aLookup root: anotherLookup [
	<typShaMethod: 'blue'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryGreen: aLookup root: anotherLookup [
	<typShaMethod: 'green'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryOrange: aLookup root: anotherLookup [
	<typShaMethod: 'orange'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryPurple: aLookup root: anotherLookup [
	<typShaMethod: 'purple'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryRed: aLookup root: anotherLookup [
	<typShaMethod: 'red'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryVeryLightGray: aLookup root: anotherLookup [
	<typShaMethod: 'veryLightGray'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]
