Extension { #name : #RPackage }

{ #category : #'*Typer-Shadow-Pharo' }
RPackage >> typShaMethodDefinedClasses: aLookup [
	<typShaMethod: 'definedClasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RPackage >> typShaMethodMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]
