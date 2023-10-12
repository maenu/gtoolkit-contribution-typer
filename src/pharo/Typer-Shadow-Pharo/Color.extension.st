Extension { #name : #Color }

{ #category : #'*Typer-Shadow-Pharo' }
Color >> typShaMethodKeywordAlpha: aLookup [
	<typShaMethod: 'alpha:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryBlue: aLookup [
	<typShaMethod: 'blue'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryGreen: aLookup [
	<typShaMethod: 'green'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryOrange: aLookup [
	<typShaMethod: 'orange'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryPurple: aLookup [
	<typShaMethod: 'purple'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryRed: aLookup [
	<typShaMethod: 'red'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodUnaryVeryLightGray: aLookup [
	<typShaMethod: 'veryLightGray'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]
