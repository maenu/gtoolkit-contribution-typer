Extension { #name : #RPackage }

{ #category : #'*Typer-Shadow-Pharo' }
RPackage >> typShaMethodUnaryDefinedClasses: aLookup root: anotherLookup [
	<typShaMethod: 'definedClasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RPackage >> typShaMethodUnaryMethods: aLookup root: anotherLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]
