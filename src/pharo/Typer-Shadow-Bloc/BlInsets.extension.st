Extension { #name : #BlInsets }

{ #category : #'*Typer-Shadow-Bloc' }
BlInsets class >> typShaMethodTopRightBottomLeft: aLookup [
	<typShaMethod: 'top:right:bottom:left:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Number typAsType.
				Number typAsType.
				Number typAsType.
				Number typAsType}
]
