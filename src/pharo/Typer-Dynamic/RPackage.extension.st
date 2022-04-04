Extension { #name : #RPackage }

{ #category : #'*Typer-Dynamic' }
RPackage >> typDynOnly: someMethods [

	^ TypDynPackageOnly new
		  package: self;
		  methods: someMethods;
		  yourself
]
