package com.fb.dbmig.migration.main;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;

import org.apache.commons.io.IOUtils;
import org.flywaydb.core.Flyway;

import com.fb.commons.flyway.AbstractMigrationService;
import com.fb.commons.flyway.FlywayBuilder;
import com.fb.commons.flyway.FlywayOperation;
import com.fb.commons.flyway.FlywayOperationExecutor;


public class MigrationService extends AbstractMigrationService {

    public static void main(final String[] args) {
        /// add project to args
        String[] newArgs = new String[args.length + 2];
        System.arraycopy(args, 0, newArgs, 0, args.length);
        newArgs[newArgs.length - 2] = "-project";
        newArgs[newArgs.length - 1] = "showcase";
        final MigrationService migrationService = new MigrationService();
        migrationService.init(newArgs, readKey());
        migrationService.execute();
    }

    @Override
    public void execute() {
        LOG.info("build flyway instance");
        final Flyway flyway = new FlywayBuilder().withDataSource(getSchemaDataSource())
                .withEnviromentProperties(getProperties()).withPlaceHolders(getPlaceHolders()).build();

        LOG.info("execute flyway operation");
        final FlywayOperationExecutor executor = new FlywayOperationExecutor();
        final FlywayOperation flywayOperation = getOptions().getOperation();

        executor.processOperation(flywayOperation, flyway);

        LOG.info("DONE");
    }

    private static byte[] readKey() {
        try {
            InputStream input = ClassLoader.getSystemResourceAsStream("keyfile");
            return IOUtils.toByteArray(input);
        } catch (IOException e) {
            LOG.log(Level.SEVERE, "Failed to read keyfile", e);
            return null;
        }
    }

    public Map<String, String> getPlaceHolders() {
        Map<String, String> placeholders = new HashMap<String, String>();
        placeholders.put("schemaUser", getProperties().getUserName());
        placeholders.put("connectUser", getProperties().getConnectUserName());
        return placeholders;
    }

}
