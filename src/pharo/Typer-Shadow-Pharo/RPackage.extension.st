Extension { #name : #RPackage }

{ #category : #'*Typer-Shadow-Pharo' }
RPackage >> typShaMethodUnaryDefinedClasses: aLookup [
	<typShaMethod: 'definedClasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RPackage >> typShaMethodUnaryMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]
