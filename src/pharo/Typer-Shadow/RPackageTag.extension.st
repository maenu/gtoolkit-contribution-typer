Extension { #name : #RPackageTag }

{ #category : #'*Typer-Shadow' }
RPackageTag >> typShaAsMethodResolver [
	^ TypMethodResolvers new
		resolvers: ((self classes select: [ :e | e inheritsFrom: TypShaShadow ]) flatCollect: #asMethodResolvers);
		yourself
]

{ #category : #'*Typer-Shadow' }
RPackageTag >> typShaAsTypeResolver [
	^ TypTypeResolvers new
		resolvers: ((self classes select: [ :e | e inheritsFrom: TypShaShadow ]) flatCollect: #asTypeResolvers);
		yourself
]

{ #category : #'*Typer-Shadow' }
RPackageTag >> typShaAsVariableResolver [
	^ TypMethodResolvers new
		resolvers: ((self classes select: [ :e | e inheritsFrom: TypShaShadow ]) flatCollect: #asVariableResolvers);
		yourself
]
