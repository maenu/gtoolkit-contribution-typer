Extension { #name : #Color }

{ #category : #'*Typer-Shadow-Pharo' }
Color >> typShaMethodAlpha: aLookup [
	<typShaMethod: 'alpha:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodBlue: aLookup [
	<typShaMethod: 'blue'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodGreen: aLookup [
	<typShaMethod: 'green'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodOrange: aLookup [
	<typShaMethod: 'orange'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodPurple: aLookup [
	<typShaMethod: 'purple'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodRed: aLookup [
	<typShaMethod: 'red'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Color class >> typShaMethodVeryLightGray: aLookup [
	<typShaMethod: 'veryLightGray'>
	^ CompiledMethod typAsFunctionTypeWithResult: Color typAsType
]
